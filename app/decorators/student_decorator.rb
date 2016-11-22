class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end


  def avg_notes(subject_item)
  	notes = subject_item.subject_item_notes.find_all { |sin| sin.student == object }
  	return "0.00" if notes.empty?
  	"#{'%.2f' % (notes.sum(&:value).to_f / notes.count)}"
end

end
