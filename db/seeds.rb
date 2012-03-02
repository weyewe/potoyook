# Basic user will have the role to upload and to vote ( the winner ) 
uploader_role = Role.create :name => "Uploader"
standard_voter_role = Role.create :name => "Voter" # this is the public vote

# a special role needs to be assigned to check any submission
submission_filter_role = Role.create :name => "SubmissionFilter"

# judge role is to select the winner: based on the vote, based on the aesthetic, etc
judge_role = Role.create :name => "Judge" # determine the winner 

# project creator can create competition etc
project_creator_role = Role.create :name => "ProjectCreator"


#  External facing role
standard_uploader = User.create_standard_uploader( 
          :email => "standard@gmail.com", :password => "willy1234",
          :password_confirmation => "willy1234"
)

submission_filter_uploader = User.create_standard_uploader(
          :email => "submission_filter@gmail.com",
          :password => "willy1234",
          :password_confirmation => "willy1234"
).add_roles([:submission_filter])


# Internal facing role 
# later 

# with role judge and project creator  << kinda admin role ? ahaha








