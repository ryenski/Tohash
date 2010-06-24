class TuplesController < ApplicationController
  def show
    
    @tuple = case params[:id].size
    when 64
      Tuple.find_by_sha2(params[:id])
    when 40
      Tuple.find_by_sha1(params[:id])
    when 32
      Tuple.find_by_md5(params[:id])
    else
      Tuple.find(params[:id])
    end
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @tuple }
      format.yaml { render :text => @tuple.content.to_yaml }
      format.text { render :text => @tuple.content.to_yaml }
      format.csv { render :text => @tuple.to_csv }
    end
  end
  
  def new
    options = params.except(:action, :controller)
    unless @tuple = Tuple.find_by_sha2(Tuple.sha2(options.to_yaml))
      @tuple = Tuple.create(:content => options)
    end
    respond_to do |format|
      format.html { redirect_to "/#{@tuple.to_param}" }
      format.xml { render :xml => @tuple, :status => :created, :location => hash_url(@tuple.sha2) }
    end
    
  end

  def create
  end
  
end
