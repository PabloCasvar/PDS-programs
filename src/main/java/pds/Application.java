package pds;
/**
 * Created by Pablo Tovar on 05/05/2017.
 */
public class Application {

    public static void main(String[] args){
        Double[] array = {0.0, Math.PI/2, Math.PI, Math.PI*3/2, Math.PI*2};
        Printer.array(Operation.sin(array));
        Printer.array(Operation.cos(array));

        Vectors v = new Vectors(new Double[]{0.0, 1.0, 0.0});
        Printer.array(v.scalarMult(1.0).toArray());
        Printer.array(v.scalarMult(3.0).toArray());

        System.out.println(v.dot(new Double[]{1.0, 0.0, 0.0}));
    }
}
