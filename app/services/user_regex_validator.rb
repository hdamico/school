class UserRegexValidator
  included do
    validates_format_of :email, with: EMAIL_REGEX
    validates_format_of :birthdate, with: BIRTHDATE_REGEX
    validates_format_of :phone, with: PHONE_REGEX
  end

  # Regex expresions for validation purpose
  EMAIL_REGEX =     %r{/^.+@.+$/}.freeze
  BIRTHDATE_REGEX = %r{/[0-3]{1}[0-9]{1}\/[0-1]{1}[0-9]{1}\/[1-2]{1}[0-9]{3}/}.freeze
  PHONE_REGEX =     %r{/^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$/}.freeze
end
