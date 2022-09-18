class TutorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name,
             :last_name,
             :email,
             :gender
end
