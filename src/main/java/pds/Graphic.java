package pds;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;

/**
 * Created by Pablo Tovar on 08/05/2017.
 */
public class Graphic {

    private Double[] x;
    private Double[] y;
    private String title = "Title";
    private String xlabel = "X Axis";
    private String ylabel = "Y Axis";
    private String leyend = "Serie";

    public Graphic(Double[] x, Double[] y){
        this.x = x;
        this.y = y;
    }

    public Graphic(Vectors x, Vectors y){
        this.x = x.toArray();
        this.y = y.toArray();
    }

    public void plot(){
        XYSeries series = new XYSeries(this.leyend);

        // Data input
        for(int i=0; i<this.x.length; i++){
            series.add(this.x[i], this.y[i]);
        }

        XYSeriesCollection dataset = new XYSeriesCollection();
        dataset.addSeries(series);

        JFreeChart chart = ChartFactory.createXYLineChart(
                this.title,
                this.xlabel,
                this.ylabel,
                dataset,
                PlotOrientation.VERTICAL,
                true,
                true,
                false
        );

        // Mostramos la grafica en pantalla
        ChartFrame frame = new ChartFrame("", chart);
        frame.pack();
        frame.setVisible(true);
    }

    public void setX(Double[] x) {
        this.x = x;
    }

    public void setY(Double[] y) {
        this.y = y;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setXlabel(String xlabel) {
        this.xlabel = xlabel;
    }

    public void setYlabel(String ylabel) {
        this.ylabel = ylabel;
    }

    public void setLeyend(String leyend) {
        this.leyend = leyend;
    }
}
