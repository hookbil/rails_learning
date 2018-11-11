# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{title: "Bash"}, {title: "PostgreSQL"}, {title: "PHP"}])
users = User.create!([
	{login: "hookbil", first_name: "Fedor", last_name: "Ushakov"},
	{login: "ivan", first_name: "Ivan", last_name: "Ivanov"}
])
tests = Test.create!([
	{ title: "Navigation in bash", category_id: categories[0].id, author_id: users[0].id },
	{title: "Writing scripts on bash", category_id: categories[0].id, level: 1, author_id: users[0].id},
	{title: "SQL basics", category_id: categories[1].id, author_id: users[0].id},
	{title: "PHP basics", category_id: categories[2].id, author_id: users[0].id}
])
questions = Question.create!([
	{body: "What is the bash?", test_id: tests[0].id},
	{body: "How to see the files in current dir?", test_id: tests[0].id},
	{body: "How to give rights for execute the file?", test_id: tests[1].id},
	{body: "How to assign a variable? ", test_id: tests[1].id}, 
	{body: "What operator you should use for showing data from table?", test_id: tests[2].id},
	{body: "How to call variable?", test_id: tests[2].id}
])
Answer.create!([
	{body: "item from dota 2", question_id: questions[0].id},
	{body: "command shell", correct: true, question_id: questions[0].id},
	{body: "cat .", question_id: questions[1].id},
	{body: "ls .", correct: true, question_id: questions[1].id},
	{body: "chmod a+r filename", question_id: questions[2].id},
	{body: "chmod +x filename", correct: true, question_id: questions[2].id},
	{body: "var == 1", question_id: questions[3].id},
	{body: "var = 1", correct: true, question_id: questions[3].id},
	{body: "SHOW", question_id: questions[4].id},
	{body: "SELECT", correct: true, question_id: questions[4].id},
	{body: "varname", question_id: questions[5].id}, 
	{body: "$varname", correct: true, question_id: questions[5].id}
])



TestStatus.create!([
	{user_id: users[0].id, test_id: tests[0].id},
	{user_id: users[1].id, test_id: tests[1].id},
	{user_id: users[1].id, test_id: tests[2].id},
	{user_id: users[1].id, test_id: tests[3].id}
])