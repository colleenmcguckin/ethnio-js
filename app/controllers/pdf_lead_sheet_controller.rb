class PdfLeadSheetController < ApplicationController

  


  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PdfLeadSheet.new(params[:id])
        send_data pdf.render, filename: "new.pdf", type: "application/pdf", disposition: "inline"
      end
    end

  end
  
end