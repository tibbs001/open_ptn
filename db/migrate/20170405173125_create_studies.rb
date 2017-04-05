class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string 'nct_id'
      t.string 'status'
      t.string 'title'
      t.string 'brief_summary'
      t.text   'detailed_description'
      t.string 'url'
      t.string 'submitter_name'
      t.string 'contact_info'
      t.string 'email'
      t.binary 'image'
      t.timestamps null: false
    end

    create_table :study_attachments do |t|
      t.integer 'study_id'
      t.string 'file_name'
      t.string 'content_type'
      t.binary 'file_contents'
      t.timestamps null: false
    end

  end
end
