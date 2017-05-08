package pds;

/**
 * Created by Pablo Tovar on 8/5/2017.
 */
public class Vectors{
    //Vector entries
    private Double[] entries;

    public Vectors(Double[] entries){
        this.entries = new Double[entries.length];
        for(int i=0; i<entries.length; i++){
            this.entries[i] = entries[i];

        }
    }

    public Vectors scalarMult(Double scalar){
        Double[] scalarMultiplication = new Double[this.entries.length];
        for(int i=0; i<this.entries.length; i++){
            scalarMultiplication[i] = scalar * this.entries[i];
        }
        return new Vectors(scalarMultiplication);
    }

    /**
     * @param array
     * @return Dot product
     */
    public Double dot(Double[] array){
        if(array.length != this.entries.length){
            return null;
        }
        Double sum = 0.0;
        for(int i=0; i<this.entries.length; i++){
            sum += array[i] * this.entries[i];
        }
        return sum;
    }

    public Double dot(Vectors vectors){
        Double[] vector = vectors.toArray();
        if(vector.length != this.entries.length){
            return null;
        }
        Double sum = 0.0;
        for(int i=0; i<this.entries.length; i++){
            sum += vector[i] * this.entries[i];
        }
        return sum;
    }

    public Double[] toArray(){
        return this.entries;
    }

}
