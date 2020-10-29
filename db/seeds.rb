basic_ruby = Course.create!(title: 'Basic Ruby')
advanced_ruby = Course.create!(title: 'Advanced Ruby')
react_and_redux = Course.create!(title: 'React and Redux')

david = Teacher.create!(email: 'david@example.com', password: '123456')
elena = Teacher.create!(email: 'elena@example.com', password: '123456')

Enrollment.create!(course: basic_ruby, teacher: david)
Enrollment.create!(course: advanced_ruby, teacher: david)
Enrollment.create!(course: react_and_redux, teacher: elena)
