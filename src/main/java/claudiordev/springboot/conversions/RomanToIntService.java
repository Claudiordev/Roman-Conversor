package claudiordev.springboot.conversions;

import java.util.TreeMap;

import org.springframework.stereotype.Service;

@Service
public class RomanToIntService {
	
	private TreeMap<Character,Integer> values = new TreeMap<Character,Integer>();
	
	/**
	 * Initiate Tree Map
	 */
	public RomanToIntService() {
			values.put('I', 1);
			values.put('V', 5);
			values.put('X', 10);
			values.put('L', 50);
			values.put('C', 100);
			values.put('D', 500);
			values.put('M', 1000);
	}
	
	/**
	 * Return Integer value of Roman String Input
	 * @param str Roman Input
	 * @return Integer value
	 */
	public Integer integerNumber(String str){
		int finalValue = 0;
 
		//Loop for Word Received and sum of values
        for (int i = 0; i < str.length(); i++){
        	//Get value from TreeMap
            int a = values.get(str.charAt(i));
 
            //Rules
            if (i + 1 < str.length()){
                int b = values.get(str.charAt(i + 1));
 
                if (a >= b) {
                	finalValue = finalValue + a;
                	
                } else {
                	finalValue = finalValue + b - a;
           
                    i++;
                }
            } else {
            	finalValue = finalValue + a;
            }
        }
 
        return finalValue;
    }

}
