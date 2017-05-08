package pds;

import junit.framework.TestCase;

/**
 * Created by Pablo Tovar on 7/5/2017.
 */
public class GeneratorTest extends TestCase {
    public void testLinspace() throws Exception {
        Double[] arrayExp = {0.0, 1.25, 2.5, 3.75, 5.0};
        Double[] arrayGen = Generator.linspace(0.0, 5.0, 5);

        assertEquals(1, Generator.linspace(0.0, 3.0, -1).length);

        for(int i=0; i<arrayExp.length; i++){
            assertEquals(0, Double.compare(arrayExp[i],arrayGen[i]));
        }

    }

}