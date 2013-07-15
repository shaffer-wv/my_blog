class Message

   # Include ActiveAttr functionality
   include ActiveAttr::Model

   # Include ActiveModel::Validations
   include ActiveModel::Validations

   # Define attributes
   attribute :name
   attribute :email
   attribute :body

   # Mass assignment security
   # Whitelist attributes that you want to mass assign user given data to
   attr_accessible :name, :email, :body

   # Validations
   # Name must be present
   validates_presence_of :name

   # Email must be present and valid email format
   validates_presence_of :email
   validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

   # Body is optional but if given must be 500 characters at maximum
   validates_length_of :body, maximum: 500
end
