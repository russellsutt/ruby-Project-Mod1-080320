Teacher.destroy_all

banks = Teacher.create(last_name: 'Banks', years_of_experience: 6)
tom = Teacher.create(last_name: 'Tom', years_of_experience: 2)

Student.destroy_all

russell = Student.create(first_name: 'Russell',last_name: 'Sutter')
kevin = Student.create(first_name: 'Kevin',last_name: 'Park')
nancy = Student.create(first_name: 'Nancy',last_name: 'Sutter')


GradeLevel.destroy_all

GradeLevel.create(name: 'eigth', teacher_id: banks.id, student_id: russell.id)
GradeLevel.create(name: 'eigth', teacher_id: banks.id, student_id: kevin.id)
GradeLevel.create(name: 'third', teacher_id: tom.id, student_id: nancy.id)
