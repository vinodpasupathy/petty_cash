class UsersController < ApplicationController

	skip_before_action :check_session, :only=>[:new,:create,:login,:validate_login]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.user_status = "active"
		if @user.save
			UserMailer1.notify(@user).deliver
			flash[:notice] = "User saved successfully!!"
			redirect_to :action => "user_index"
		else
			flash[:notice] = "User not saved !!"
			render :new
		end
	end

	def login
		@user = User.new
	end

	def validate_login
		params.permit!
		@user = User.where params[:user]
		user_details = @user.first
		if not @user.blank? 
			if user_details.user_status == "active"
				session[:user_id] = @user.first.id
				@us= @user.pluck(:role)[0]
				if @us == "Admin"
					redirect_to users_path
				elsif @us== "User"
					redirect_to :action => "single_user_index"
				else
					redirect_to :action => "claim_index_financier"
				end
			else
				flash[:notice] = "You are not an Active user"
				redirect_to root_path
			end
		else
			flash[:notice] = "Invalid Mobile Number or password"
			redirect_to root_path
		end
	end

	def user_index
		@user = User.where(:user_status=>"active")
		@user1 = User.where(:user_status => "inactive")
	end

	def user_status
		@u_val = params[:value]
		@user = User.find params[:id]
		if @u_val == "Turn Inactive"
			@user.update_attributes(:user_status => "inactive")
			flash[:notice] = "User turned Inactive"
			redirect_to :action => "user_index"
		elsif @u_val == "Turn active"
			@user.update_attributes(:user_status => "active")
			flash[:notice] = "User turned Active"
			redirect_to :action => "user_index"
		end		
	end

	def logout
		session[:user_id]=nil
    	redirect_to root_path
  	end

	def claim_page
	    @user = User.new
	    @user = User.find(session[:user_id]).name

		@expense = Expense.new
 		@expense.voucher = params[:file]
	end

	def get_claim
		@expense = Expense.new(expense_params)
		if params[:commit] == "Save and close"
			@expense.save
			flash[:notice] = "Expense claimed successfully!!"
			redirect_to :action => "single_user_index"
		elsif params[:commit] == "Save and continue"
			@expense.save
			flash[:notice] == "Expense claimed successfully!!"
			redirect_to :action => "claim_page"
		else
			flash[:notice] = "Expense not claimed !!"
			render :claim_page
		end
	end

	def edit_claim
		@user = User.new
	    @user = User.find(session[:user_id]).name
		
		@expense = Expense.find params[:id]
	end

	def update_claim
		@expense = Expense.find params[:id]
		if @expense.update_attributes(expense_params)
			flash[:notice] = "Expense updated successfully!!"
			redirect_to :action => "single_user_index"
		else
			flash[:notice] = "Expense not updated !!"
			render :claim_page
		end
	end

	def delete_claim
		@expense = Expense.find params[:id]
		if @expense.delete
			flash[:notice] = "Expense deleted successfully!!"
			redirect_to :action => "single_user_index"
		else
			flash[:notice] = "Expense not deleted"
			render "single_user_index"
		end
	end

	
	def index
		@debit = Debit.where(:date => ("#{Date.today.year}-#{Date.today.strftime('%m')}-01")..("#{Date.today.year}-#{Date.today.strftime('%m')}-31"))
		@expense1 = Expense.where(:claim_status => "Need Approval").order("date ASC")
	end

	def claim_history
		if params[:commit] == "Get history"
            val = params[:commit]
			@expen = Expense.new
			name = params[:expense][:claimed_by]
			type = params[:expense][:expense_type]
			f_date = params[:expense][:from_date]
			t_date = params[:expense][:to_date]
			exp = Expense.where.not(:claim_status => nil)
		    if name == "" && f_date != ""
                if type == ""
                    @expense=exp.where(:date=>f_date..t_date).where.not(:claim_status => "Need Approval").order("date ASC")
                else
                    @expense= exp.where(:expense_type=>type).where(:date=>f_date..t_date).where.not(:claim_status => "Need Approval").order("date ASC")
            	end
            elsif type == "" && f_date != ""
               	if name == ""
                    @expense=exp.where(:date=>f_date..t_date).where.not(:claim_status => "Need Approval").order("date ASC")
                else
                    @expense=exp.where(:claimed_by=>name).where(:date=>f_date..t_date).where.not(:claim_status => "Need Approval").order("date ASC")
                end
            elsif name == "" && f_date == ""
                @expense=exp.where(:expense_type=>type).where.not(:claim_status => "Need Approval").order("date ASC")
			elsif type == "" && f_date == ""
		   		@expense=exp.where(:claimed_by=>name).where.not(:claim_status => "Need Approval").order("date ASC")
            elsif f_date ==  "" &&  t_date == ""
                @expense=exp.where(:claimed_by=>name).where(:expense_type=>type).where.not(:claim_status => "Need Approval").order("date ASC")
            elsif name != "" && type != "" && f_date != "" && t_date != ""
               	@expense=exp.where(:claimed_by=>name,:expense_type=>type).where(:date=>f_date..t_date)
      		end
        else
        	@expen = Expense.new
        	@expense = Expense.where.not(:claim_status => nil).where.not(:claim_status => "Need Approval").order("created_at DESC").last(20)
		end
    end

 	def approved_claims
 		val = params[:commit]
        s_date = params[:expense][:start_date]
        e_date = params[:expense][:end_date]
        @exp = Expense.where(:date => s_date..e_date)
        if val == "Approved claims"
            @expense1 = @exp.where(:claim_status => "Approved").order("date ASC")
        elsif val == "declined claims"
            @expense2 = @exp.where(:claim_status => "Declined").order("date ASC")
        else
            flash[:notice] = "Please try again"
            redirect_to :action => "claims_report"
        end
    end


	def claim_index_financier
		@expense1 = Expense.where(:claim_status => nil).order("date ASC")
	end

	def approve_claim
		@user = User.new
	    @user = User.find(session[:user_id]).name

		ids = params[:expense_ids]
        if ids.blank? then
           	flash[:notice] = "select any one"
        else 
            val = params[:commit] 
			exp = ids.map {|i| Expense.find(i)}
			count=[]
		end
   		count=[]
		case val
			when "approve" then
				exp.map {|i| i.update_columns(:claim_status => "Approved", :approved_amount => i.total, :approved_by => @user)}
				exp.each {|i| count << i.approved_amount.to_i}
				tot = Debit.last.total_expenses.nil? ? 0 : Debit.last.total_expenses
				Debit.last.update_attributes(:total_expenses => tot + count.sum)
				flash[:notice] = "Claim Approved"
				if admin? then redirect_to :action => "index" else redirect_to :action => "claim_index_financier" end
			when "decline" then
				exp.map {|i| i.update_columns(:claim_status => "Declined", :approved_amount => "0", :approved_by => @user)}
				flash[:notice] = "Claim Declined"
				if admin? then redirect_to :action => "index" else redirect_to :action => "claim_index_financier" end
			when "approve_on_condition"
				exp.map {|i| i.update_attributes(:claim_status => "Approved on condition", :approved_by => @user)}
				exp.each {|i| count << i.approved_amount.to_i}
				tot = Debit.last.total_expenses.nil? ? 0 : Debit.last.total_expenses
				Debit.last.update_attributes(:total_expenses => tot + count.sum)
				flash[:notice] = "Claim approved on condition"
				if admin? then redirect_to :action => "index" else redirect_to :action => "claim_index_financier" end
			when "req_for_approval"
				exp.map {|i| i.update_columns(:claim_status => "Need Approval")}
				flash[:notice] = "Added to Waiting claims"
				redirect_to :action => "claim_index_financier"
			else
				flash[:notice] = "Please Select at least one"
				redirect_to :action => "claim_index_financier" if financier?
                redirect_to :action => "index" if admin?
		end
	end
	

	def single_user_index
		@u = User.find(session[:user_id]).name
		@expense = Expense.where(:claimed_by => @u)
	end

	def show_image
		@img = params[:format]
		@ex = Expense.find(@img)
	end

	def add_debit
		@debit = Debit.new
	end

	def get_debit
		@debit = Debit.new(debit_params)
		if @debit.save
			flash[:notice] = "Amount Added successfully!!"
			redirect_to :action => "debit_history"
		else
			flash[:notice] = "Please try again!!"
			render :add_debit
		end
	end
     
    def debit_edit
    	@debit = Debit.find params[:id]
    end

    def debit_update
        @debit = Debit.find params[:id]
        if @debit.update_attributes(debit_params)
            flash[:notice] = "Debit updated successfully!!"
            redirect_to :action => "debit_history"
        else
    		flash[:notice] = "Debit not updated !!"
            render :debit_edit
        end
    end

    def debit_history
        @debit = Debit.all.order('date ASC')
    end
 
private

	def user_params
		params.require(:user).permit!
	end

	def expense_params
		params.require(:expense).permit!
	end

	def debit_params
		params.require(:debit).permit!
	end

end

