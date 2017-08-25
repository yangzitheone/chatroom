module ChatroomsHelper
  def getusername(email)
    @emailarray[] = email.split("@")
    @emailarray[0]

  end
end
