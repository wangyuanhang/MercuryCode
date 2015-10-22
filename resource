@Path("/hello")
public class HelloResource {
	private HelloService hs;
	
	public HelloResource() {
		if (hs==null) {
			ApplicationContext actx = new ClassPathXmlApplicationContext("config.xml");
			hs = (HelloService)actx.getBean("helloService");
		}
	}
	
	@POST
	@Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
	public UserInfo execute(
			@FormParam("name") String name,
			@FormParam("age") int age) {
		User user = new User();
		user.setName(name);
		user.setAge(age);
		return hs.process(user);
	}
}
