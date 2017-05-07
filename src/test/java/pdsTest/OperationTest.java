package pdsTest;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import pds.Operation;

/**
 * Unit test for simple App.
 */
public class OperationTest extends TestCase
{
    public static void testSummatory(){
        Double[] arrayZero = {0.0, 0.0, 0.0};
        Double[] arrayEmpty = {};
        Double[] arrayOnes = {1.0, 1.0, 1.0};

        assertEquals(0.0, Operation.Summatory(arrayZero));
        assertEquals(null, Operation.Summatory(arrayEmpty));
        assertEquals(3.0, Operation.Summatory(arrayOnes));
    }

    public static void testDot(){
        Double[] x = {1.0, 0.0, 0.0};
        Double[] y = {0.0, 1.0, 0.0};
        Double[] z = {0.0, 0.0, 1.0};
        Double[] i = {1.0, 0.0};
        Double[] x2 = {2.5, 0.0, 0.0};

        assertEquals(1.0, Operation.Dot(x, x));
        assertEquals(1.0, Operation.Dot(y, y));
        assertEquals(0.0, Operation.Dot(x, z));
        assertEquals(null, Operation.Dot(i, x));
        assertEquals(2.5, Operation.Dot(x, x2));
        assertEquals(Operation.Dot(x, x2), Operation.Dot(x2, x));
    }
}