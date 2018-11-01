# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{title: "Bash"}, {title: "PostgreSQL"}, {title: "PHP"}])
tests = Test.create!([
	{title: "Navigation in bash", categories[0].id},
	{title: "Writing scripts on bash", categories[0].id, level: 1},
	{title: "SQL basics", categories[1].id},
	{title: "PHP basics", categories[2].id}
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
	{body: ""}

])