require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_i

if memo_type == 1
    puts "拡張子を除いたファイルを入力してください"
    
    file_name = gets.to_s
    
    p "メモしたい内容を記入してください"
    p "完了したらCtrl + Dを押します"
    
    memo_enter = readlines
    
    CSV.open("#{file_name}.csv","w") do |csv|
        csv << ["#{memo_enter}"]
    end
    
elsif memo_type == 2
    puts "編集したいファイル名（拡張子を除く）を記入してください"
    file_name = gets.to_s
    
    p "追記したい内容を記入してください"
    
    memo_enter = readlines
    
    CSV.open("#{file_name}.csv","a") do |csv|
        csv << ["#{memo_enter}"]
    end

else
    puts "半角で1 or 2 を入力してください"
end
