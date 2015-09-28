require 'fileutils'
# TODO attendees ディレクトリがすでに存在する場合は以下の処理を飛ばしたい

# reportsディレクトリに移動
Dir.chdir('reports')


# reportsディレクトリ内のディレクトリを全て取得
dirs = Dir.glob('*')
# 各ディレクトリを対象にする（dir)
dirs.each do |dir|
  # 既存のフォルダ名を分解する
  year = dir[0..3]
  month = dir[4..5]
  day = dir[6..7]

  # attendeesフォルダを作成し、年月日ごとのフォルダを作成
  dest = "../attendees/#{year}/#{month}/#{day}/"
  FileUtils.mkdir_p(dest)

  # 既存のフォルダに移動する
  Dir.chdir(dir)
  # フォルダにあるすべてのファイルのファイル名を配列で取得する
  files = Dir.glob("*")

  FileUtils.cp(files, dest)
  # reportsのフォルダに移動する
  Dir.chdir('..')

end
