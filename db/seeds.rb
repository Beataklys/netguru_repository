puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
FIRST_NAMES = %w(Jaria Lla Losia Basia Piola)
LAST_NAMES = %w(Lowak Mowalski Lost Pos Klos)
SUBJECTS = %w(Geology Math Chemistry Russian Geography)
User.create!(email: 'beata@beata4.pl',password: 'beatabeata')


  Teacher.create!(first_name: "Jan",last_name: "Wilk", academic_title: TEACHER_TITLES.sample)
  Teacher.create!(first_name: "Wanda",last_name: "Rutkiewicz", academic_title: TEACHER_TITLES.sample)
  Teacher.create!(first_name: "Jerzy",last_name: "Kukuczka", academic_title: TEACHER_TITLES.sample)

teachers = Teacher.all
SUBJECTS.each do |subject|
  SubjectItem.create!(
    title: subject,
    teacher: teachers.sample
  )
end

25.times do
  Student.create!(
    first_name: FIRST_NAMES.sample,
    last_name: LAST_NAMES.sample
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

puts "Seeds: done"
