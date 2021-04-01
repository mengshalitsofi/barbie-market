class BarbieValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if attribute == :name && (Barbie.find_by_name(value))
      record.errors.add(attribute, "already exists. Please choose a different name.")
    end
  end

end