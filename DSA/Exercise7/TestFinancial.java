public class TestFinancial {
    public static void main(String[] args){
        double presentValue=100000;
        double growthRate=0.10;
        int years=5;
        System.out.println("--- Recursive Forecast ---");
        double result=FinancialForecast.futureValue(presentValue,growthRate,years);
        System.out.printf("Future Value after %d years: Rs. %.2f\n",years,result);

        System.out.println("\n--- Memoized Forecast ---");
        double memo[]=new double[years+1];
        double resultMemo=FinancialForecast.futureValueMemo(presentValue, growthRate, years, memo);
        System.out.printf("Future value after %d years: Rs. %.2f\n",years,resultMemo);

        System.out.println("\n---Year-by-Year ---");
        for(int y=1;y<=years;y++){
            double value=FinancialForecast.futureValue(presentValue, growthRate, y);
            System.out.printf("Year %d: Rs. %.2f\n",y,value);
        }
    }    
}
