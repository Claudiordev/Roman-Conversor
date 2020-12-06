package claudiordev.springboot.conversions;

import java.util.TreeMap;

import org.springframework.stereotype.Service;

@Service
public class IntToRomanService {
	
	private TreeMap<Integer,String> values = new TreeMap<Integer,String>();

	/**
	 * Initiate Tree Map for Comparsion of Values
	 */
	public IntToRomanService() {
        values.put(1, "I");
        values.put(4, "IV");
        values.put(5, "V");
        values.put(9, "IX");
        values.put(10, "X");
        values.put(40, "XL");
        values.put(50, "L");
        values.put(90, "XC");
        values.put(100, "C");
        values.put(400, "CD");
        values.put(500, "D");
        values.put(900, "CM");
        values.put(1000, "M");
	}
	
	/**
	 * Return Roman Value 
	 * @param integer value to be Converted
	 * @return String Roman Value
	 */
	public String romanNumber(int integer) {
		
        if (values.containsKey(integer)) {
            return values.get(integer);
        }
        
        //Return value of approximated key of introduced number if not the same as the map plus the restant
        //Example, 11 = 10 + 1 = X + I = XI;
        return values.get(values.floorKey(integer)) + romanNumber(integer-values.floorKey(integer));
    }

}
