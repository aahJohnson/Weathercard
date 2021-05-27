package Model;

public class weatherBean {

	private String cityName;

	private String countryCode;

	private static String cloudPattern;

	public weatherBean(String cityName, String countryCode) {
		this.cityName = cityName;
		this.countryCode = countryCode;
	}

	public String getCityName() {
		return cityName;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public static String getCloudPattern() {
		return cloudPattern;
	}
	
	public void setCloudPattern(String cloudPattern) {
		weatherBean.cloudPattern = cloudPattern;
	}
}