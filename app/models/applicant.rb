class Applicant < ApplicationRecord
  validates :name, presence: true,  length: {maximum: 100 } 
  # validates :profile_photo , blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }
  # validate :correct_document_mime_type
  validates :dob, presence:true 
  validate :validate_age 
  validates :phone_no1, presence: true, length: { maximum: 13 }
  validates :phone_no2, length: { maximum:13 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
  format: { with: Constants::VALID_EMAIL_REGEX }
  validates :currentAddress, presence: true, length: { maximum: 255 }
  validates :hometownAddress, length: { maximum: 255 }
  validates :bachelorUni , presence: true , length: { maximum: 100 }
  validates :bachelorYear, length: { maximum: 20 }
  validates :bachelorDegree, length: { maximum: 100 }
  validates :masterUni, length: { maximum: 100 }
  validates :masterYear, length: { maximum: 20 }
  validates :masterDegree, length: { maximum: 100 }
  # validates :diploma_name, length: { maximum: 100 }
  validates :programming , length: { maximum: 100 }
  validates :certificate, length: { maximum: 255 }
  validates :english, length: { maximum: 255 }
  validates :japanese , length: { maximum: 255 }
  validates :otherLang , length: { maximum: 255 }
  validates :totalExperience , length: { maximum: 3 }
  validate :validate_totalExpyear
  private
  def validate_age
      if dob.present? && dob.to_i > 16.years.ago.to_i
          errors.add(:dob, 'You should be over 16 years old.')
      end
  end
  def validate_totalExpyear
    if totalExperience.present? && totalExperience > 10
      errors.add(:totalExperience , 'Ur position is not here ! Ur Experience is greater than \'GOD!\'')
    end
  end
end
