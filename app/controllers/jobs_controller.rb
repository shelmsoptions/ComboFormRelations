class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
    @job.company = Company.new
  end

  def create
    @job = Job.new( job_params )
    
    respond_to do |format|
      if @job.save
        format.html { redirect_to root_path, notice: 'New Job Created !' }
      else
        format.html { render new_job_path }
      end 
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
  
  private
  def job_params
    params.require( :job ).permit( :job_code, :company_id, company_attributes: [ :name ] )
  end
end
