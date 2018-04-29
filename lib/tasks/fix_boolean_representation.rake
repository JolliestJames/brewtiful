desc 'Represent boolean column values as integers'
task :fix_boolean_representation do
  Brew.where("boolean_column = 't'").update_all(boolean_column: 1)
  Brew.where("boolean_column = 'f'").update_all(boolean_column: 0)
end
