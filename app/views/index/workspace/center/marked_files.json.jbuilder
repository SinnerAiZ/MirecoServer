if @code
  json.code @code
else
  json.files do
    json.array! @mark_records do |record|
      file = record.file
      next unless file
      seed = record.file_seed
      json.file_type file.file_type
      json.editors_count seed.editors_count
      json.file do
        case file.file_type
        when :folders
          json.extract! file, :id, :name, :created_at, :updated_at
        else
          json.extract! file, :id, :name, :tag, :is_shown, :created_at, :updated_at
        end
        json.is_marked true
      end
    end
  end
end
