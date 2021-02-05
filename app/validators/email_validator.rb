class EmailValidator < ActiveModel::Validator
    def validate(record)
        unless record.email.match(/\A[^@\s]+@[^@\s]+\z/)
            record.errors.add :email, "is not a valid email address!"
        end
    end
end