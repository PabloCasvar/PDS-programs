package pds;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
import org.jfree.ui.ApplicationFrame;
import org.jfree.ui.RefineryUtilities;
import javax.swing.JFrame;

/**
 * Created by Pablo Tovar on 05/05/2017.
 */
public class Application {

    public static void main(String[] args){
        Double[] array = {0.0, Math.PI/2, Math.PI, Math.PI*3/2, Math.PI*2};
        Printer.array(Operation.sin(array));
        Printer.array(Operation.cos(array));

        Vectors v = new Vectors(new Double[]{0.0, 1.0, 5.0});
        Printer.array(v.scalarMult(1.0).toArray());
        Printer.array(v.scalarMult(3.0).toArray());

        System.out.println(v.dot(new Double[]{1.0, 0.0, 0.0}));

        // create a basis function
        Vectors vector = Vectors.linspace(0.0, 2*Math.PI, 100);

        Vectors cosVector = Vectors.cos(vector);
        Printer.vector(cosVector);

        Vectors sinVector = Vectors.sin(vector);
        Printer.vector(sinVector);

        Graphic graph = new Graphic(vector, sinVector);
        graph.setLeyend("Serie local");
        graph.plot();

        Vectors v1 = new Vectors(new Double[]{1.0, 10.0, 1.0});
        Printer.vector(v.multEntries(v1));
        Printer.vector(v.sumEntries(v1));

    }
}
