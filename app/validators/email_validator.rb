class emailValidator < ActiveModel::Validator
    def validate(record)
        unless record.email.match(/\A[^@\s]+@[^@\s]+\z/)
            record.errors.add :email, "Please give a valid email address!"
        end
    end
end