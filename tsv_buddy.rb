# frozen_string_literal: true

require 'csv'

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    csvdata = CSV.parse(tsv, { headers: true, col_sep: "\t" })
    @data = csvdata.map(&:to_h)
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    headers = @data[0].keys.join("\t") + "\n"
    contents = @data.map { |row| row.values.join("\t") }.join("\n") + "\n"
    headers + contents
  end
end
