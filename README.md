# Mean-Variance Optimal Risky Portfolio Using Simulation

### Introduction

In this report we will be discussing portfolio optimization of securities by determining their optimal weights
in a portfolio. Our goal is to write a function to find the optimal way to structure a portfolio to get
maximum return with the least amount of risk. To accomplish this, we will be using the Mean-Variance
portfolio simulation method. Mean-Variance optimization is a key element of data-based investing. In this
process we measure an asset’s risk against its likely return and invest in assets based on the risk adjusted
return also known as Sharpe ratio. Our function will take inputs like a vector of ticks, start date, end date
and risk-free return rate. Using these inputs, we will be taking the monthly stock returns of seven assets
from 2014 to 2017 and calculate the stock means and variance. We will then randomly assign weights to
the seven assets to create portfolios. For each portfolio we will calculate the portfolio mean which signifies
the portfolio return/reward and portfolio sigma which signifies portfolio risk. Using these two values we will
determine the Sharpe Ratio of each portfolio. Finally, we will plot all the portfolios we generated and select
the portfolio with the highest Sharpe ratio as the optimal portfolio.

### Stock Data

We use a R library “Quantmod” to get the monthly returns, during the time frame of January 1st, 2014, to
December 31st, 2017, of the below mentioned stocks being used for the portfolio simulation analysis.

### Stock Return Mean and Covariance:
To calculate the portfolio reward and portfolio risk we need to first calculate the mean and covariance of
returns of each security. Here risk is the sigma and reward is the mean (expected return). An investor will
2
measure risk based on the volatility of the given asset. Sigma is a calculation based on how much the asset’s
price has changed and how quickly it has done so over a period. It’s important to understand that sigma
measures volatility in all directions. The expected return of a stock is calculated based on past returns along
with its past volatility. Expected return is a prediction of what will probably happen in the future based on
past behaviors.

### Weights:
Portfolio weight is the percentage of an investment portfolio that a particular holding or type of holding
comprises. The most basic way to determine the weight of an asset is by dividing the dollar value of a
security by the total dollar value of the portfolio. In our function however we are assigning weights to each
asset randomly for simulation purposes. The sum of the weights amounts to 1

### Portfolio Mean:

The Portfolio Mean measures the mean or expected value of the probability distribution of the investment
returns. The expected return of a portfolio is calculated by multiplying the weight of each asset by its
expected return and adding the values for each investment.

### Portfolio Sigma:

Portfolio Sigma or the standard deviation of a portfolio measures how much the investment returns deviate
from the mean of the probability distribution of investments. In simpler terms it signifies the risk that a
portfolio holds a particular collection of assets.

### Portfolio Sharpe Ratio:

Sharpe ratio is the measure of risk-adjusted return of a financial portfolio. A portfolio with a higher Sharpe
ratio is considered superior relative to other portfolios. It is a measure of excess portfolio return over the
risk-free rate relative to its standard deviation.
Using the Portfolio Mean, Portfolio Sigma, and using the risk free rate, which in our case is 0, we calculated
the Sharpe Ratio of each portfolio. Using the Sharpe ratio we determine the optimal portfolio.

### Compiled Portfolios:

For the purpose of our simulation, we created 700 portfolios. This gives us a large enough pool to determine
how the portfolio mean-variance metrics change with the change in weights of each asset. This allows us to
appropriately demonstrate how the mean-variance simulation method works.

### Optimization:

An important investment preference on the efficient frontier is the portfolio with the maximum Sharpe ratio.
The Sharpe ratio represents the expected return per unit of risk. The portfolio with maximum Sharpe ratio
gives the highest expected return per unit of risk and also is the most “risk-efficient” portfolio. Geometrically,
the portfolio with maximum Sharpe ratio is the point where a line through the origin is tangent to the efficient
frontier which is called the tangency portfolio. An optimal portfolio generates the highest possible return
based on an investor’s chosen amount of risk. It also generates the least amount of risk for the investor’s
preferred return.


### Graphs Analysis:

### Tangency Portfolio Weights:

From the data output and the Tangency Portfolio Weights chart, the portfolio number 356 has the highest
Sharpe ratio of 0.4546267. It means the investor should invest 5.44% of the money in General Electric,
10.53% in ExxonMobil, 5.79% in The Greenbrier Companies, 19.85% in Pfizer, 22.21% in Starbucks, 7.86%
in Honda Motor Company and 28.31% in NVDA. If the investor invests in this combination, we are holding
an efficiently diversified portfolio. The Tangency Portfolio is composed of only risky assets. The tangency
portfolio has the highest Sharpe ratio of any portfolio composed of risky assets. The tangency Portfolio
Weights show that this portfolio has the most assets invested in Starbucks, Pfizer and NVDA.

### Portfolio Optimization:

This chart shows 700 portfolios with their Annualized Risk % and Annualized Returns %. And Tangency
Portfolio of 4.21% of risk and 1.91% of Expected Returns. Efficient portfolios offer investors the highest
possible expected return for a given level of risk. The set of efficient portfolios is called the efficient frontier.
As investors add stocks to a portfolio, the efficient portfolio improves. An investor seeking high expected
returns and low volatility should invest only in efficient portfolios. Investors will choose from the set of
efficient portfolios based on their risk tolerance.

### Conclusion:

Through Mean-Variance risky portfolio, investors can draw practical guides into constructing investment
portfolios that maximize their expected return based on a given level of risk. In this particular assignment,
we created an R function to analyze various metrics of stock returns and output information about the
returns, such as the risk and Sharpe ratio. The function uses this information to find the optimal portfolio,
which is displayed graphically in RStudio.
The output results show that investors should invest base on the following weights: 5.44% in General Electric,
5.79% in The Greenbrier Companies, 7.86% in Honda Motor Company, 10.53% in ExxonMobil, 19.85% in
Pfizer, 22.21% in Starbucks and 28.31% in NVDA.
There are some limitations while using mean-variance optimization such as when the assumption of normality.
If the return distribution is not symmetric, the standard deviation is not reliable. This method also has
various assumptions that can affect the results of the investment such as ignoring taxation and investment
costs, markets are efficient and rational.
