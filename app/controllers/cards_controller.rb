class CardsController < ApplicationController
  unloadable
  ROWS = 4
  COLUMNS = 3

  def index
    Rails.logger.info params[:ids]
    @issues = Issue.find_all_by_id(params[:ids])
    pdf = Prawn::Document.new(:page_size => "A4", :margin => [0, 0])
    pdf.define_grid(:columns => COLUMNS, :rows => ROWS, :gutter => 0)
    counter = 0
    @issues.each_with_index do |issue, index|
      c_i = index % COLUMNS
      r_i = counter
      pdf.grid(r_i,c_i).bounding_box do
        pdf.stroke_bounds
	# TODO count numbers from grid size
	pdf.move_down 16
	pdf.font("#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf") do
	  pdf.text issue.subject, :align => :center, :size => 18
	end
	pdf.text_box(issue.id.to_s, :at => [5, 20], :size => 20)
	pdf.text_box(issue.estimated_hours.to_s, :at => [133, 20], :size => 20, :align => :right, :width => 60)
      end
      if c_i == COLUMNS - 1 then counter += 1 end
      if counter > ROWS - 1
        pdf.start_new_page
        pdf.define_grid(:columns => COLUMNS, :rows => ROWS, :gutter => 0)
        counter = 0
      end
    end
    filename = @issues.map{ |x| unless x.assigned_to_id.nil? then User.find(x.assigned_to_id).login end }.compact.uniq.join("_")
    respond_to do |format|
      format.pdf { send_data(pdf.render, :type => 'application/pdf', :filename => "#{filename}.pdf") }
    end
  end
end
