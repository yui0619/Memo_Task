require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i

if memo_type == 1
  puts "新規でメモを作成します。拡張子を除いたファイルを記入してください。"
  file_name = gets.chomp

  puts "メモしたい内容を記入してください。"
  puts "完了したらctrl + Dを押します。"
  input_memo = $stdin.read
  memo = input_memo.chomp

  CSV.open("#{file_name}.csv","w") do |csv|
    csv << ["#{memo}"]
end

elsif memo_type == 2
  puts "既存のメモを編集します。拡張子を除いたファイルを記入してください。"
  file_name = gets.chomp

  puts "メモしたい内容を記入してください。"
  puts "完了したらctrl + Dを押します。"
  input_memo = $stdin.read
  memo = input_memo.chomp

  CSV.open("#{file_name}.csv","a") do |csv|
    csv << ["#{memo}"]
end

else
  puts "1か2を入力してください。"
end
