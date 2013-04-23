ActiveAdmin.register Shop do

 action_item :only => :index do
    link_to 'Upload CSV', :action => 'upload_csv'
  end

  collection_action :upload_csv do
    render "admin/csv/upload_csv"
  end

  collection_action :import_csv, :method => :post do
  	
    flash[:notice] = CsvDb.import_shops(params[:dump][:file], true)
    redirect_to :action => :index
  end
  
end
