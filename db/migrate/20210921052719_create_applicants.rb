class CreateApplicants < ActiveRecord::Migration[6.1]
  def change
    create_table :applicants do |t|
      t.string :name, varchar: 100, null: false
      t.string :profilePhoto, varchar: 250
      t.timestamp :dob
      t.string :phone_no1, varchar: 30, null:false
      t.string :phone_no2, varchar: 30
      t.string :email, varchar: 100
      t.string :currentAddress, varchar: 255, null: false
      t.string :hometownAddress, varchar: 255
      t.string :bachelorUni
      t.string :bachelorYear, varchar: 100
      t.string :bachelorDegree, varchar: 100
      t.string :masterUni, varchar: 100
      t.string :masterYear, varchar: 100
      t.string :masterDegree, varchar: 100
      t.string :diplomaName, varchar: 100
      t.string :certificate, varchar:255
      t.text :programming
      t.text :english
      t.text :japanese
      t.text :otherLang
      t.text :internshipInfo
      t.text :jobExperience
      t.integer :totalExperience, nvarchar: 3
      t.text :comment
      t.timestamps
    end
  end
end
