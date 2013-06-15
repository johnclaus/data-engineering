class SubsidiaryDataController < ApplicationController
  def index
    @purchases = Purchase.all
    @purchasers = Purchaser.count
    @items = Item.count
    @merchants = Merchant.count
    @subsidiary_data = SubsidiaryData.all
  end
  
  def new
    @subsidiary_data = SubsidiaryData.new
  end

  def create
    # Mass assignment is lame; strong parameters in Rails 4 are quite nice.
    @subsidiary_data = SubsidiaryData.new(params[:subsidiary_data].permit(:uploaded_data))
    if @subsidiary_data.save
      @subsidiary_data.process_uploaded_file
      redirect_to subsidiary_data_path
    else
      render :new
    end
  end

  def destroy
    @subsidiary_data = SubsidiaryData.find(params[:id])
    @subsidiary_data.destroy
    redirect_to subsidiary_data_path
  end
end