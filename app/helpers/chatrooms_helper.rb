module ChatroomsHelper
  # 通过邮件地址获取客户的用户名
  def getusername(email)
      @emailarray[] = email.split("@")
      @emailarray[0]
  end
end
