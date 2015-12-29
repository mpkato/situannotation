require 'csv'
namespace :import do
  FILEPATH = "#{Rails.root}/db/sentences.tsv"
  desc "Import sentences"
  task :sentences => :environment do
    sentences = []
    CSV.foreach(FILEPATH, col_sep: "\t") do |row|
      sid = row[0]
      body = row[1]
      sentences << Sentence.new(sid: sid, body: body)
    end
    Sentence.import sentences
  end
end
