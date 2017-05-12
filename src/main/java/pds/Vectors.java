package pds;

/**
 * Created by Pablo Tovar on 8/5/2017.
 */
public class Vectors{
    //Vector entries
    private Double[] entries;
    public int length;

    public Vectors(Double[] entries){
        this.entries = new Double[entries.length];
        for(int i=0; i<entries.length; i++){
            this.entries[i] = entries[i];
        }

        this.length = this.entries.length;
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

    /**
     *
     * @param vectors
     * @return multiplication entry by entry of given vectors
     */
    public Vectors multEntries(Vectors vectors){
        if(vectors.length != this.entries.length){
            return null;
        }
        Double[] vector = vectors.toArray();
        Double[] multip = new Double[this.entries.length];
        for(int i=0; i<this.entries.length; i++){
            multip[i] = vector[i]*this.entries[i];
        }
        return new Vectors(multip);
    }

    public Vectors multEntries(Double[] vector){
        return multEntries(new Vectors(vector));
    }

    public Vectors sumEntries(Vectors vectors){
        if(vectors.length != this.entries.length){
            return null;
        }
        Double[] vector = vectors.toArray();
        Double[] sum = new Double[this.entries.length];
        for(int i=0; i<this.entries.length; i++){
            sum[i] = vector[i]+this.entries[i];
        }
        return new Vectors(sum);
    }

    public Vectors sumEntries(Double[] vector){
        return sumEntries( new Vectors(vector));
    }

    public static Vectors linspace(Double start, Double end, int points){
        return new Vectors(Generator.linspace(start, end, points));
    }

    public static Vectors sin(Double[] array){
        return new Vectors(Operation.sin(array));
    }

    public static Vectors sin(Vectors vectors){
        return new Vectors(Operation.sin(vectors.toArray()));
    }

    public static Vectors cos(Double[] array){
        return new Vectors(Operation.cos(array));
    }

    public static Vectors cos(Vectors vectors){
        return new Vectors(Operation.cos(vectors.toArray()));
    }

    public Double[] toArray(){
        return this.entries;
    }

}
