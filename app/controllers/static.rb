class Static < Application
  provides :xml
  
  def index
    render
  end
  
  def clickbank_survey_storage
    if params[:from] && params[:to] && params[:subject]
      send_mail(ClickbankMailer, :survey_storage, {
            :from => params[:from],
            :to => params[:to],
            :subject => params[:subject]
          })
      render :success
    else
      render :failure
    end 
  end
  
end
