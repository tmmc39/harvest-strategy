pragma solidity 0.5.16;

import "./base/ConvexStrategyUL.sol";

contract ConvexStrategyEURTMainnet is ConvexStrategyUL {

  address public eurt_unused; // just a differentiator for the bytecode

  constructor() public {}

  function initializeStrategy(
    address _storage,
    address _vault
  ) public initializer {
    address underlying = address(0xFD5dB7463a3aB53fD211b4af195c5BCCC1A03890);
    address rewardPool = address(0xD814BFC091111E1417a669672144aFFAA081c3CE);
    address crv = address(0xD533a949740bb3306d119CC777fa900bA034cd52);
    address cvx = address(0x4e3FBD56CD56c3e72c1403e103b45Db9da5B9D2B);
    address dai = address(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    bytes32 sushiDex = bytes32(0xcb2d20206d906069351c89a2cb7cdbd96c71998717cd5a82e724d955b654f67a);
    ConvexStrategyUL.initializeBaseStrategy(
      _storage,
      underlying,
      _vault,
      rewardPool, //rewardPool
      39,  // Pool id
      dai,
      1, //depositArrayPosition
      underlying,
      4, //nTokens
      false, //metaPool
      1000 // hodlRatio 10%
    );
    rewardTokens = [crv, cvx];
    storedLiquidationPaths[crv][weth] = [crv, weth];
    storedLiquidationDexes[crv][weth] = [sushiDex];
    storedLiquidationPaths[cvx][weth] = [cvx, weth];
    storedLiquidationDexes[cvx][weth] = [sushiDex];
    storedLiquidationPaths[weth][dai] = [weth, dai];
    storedLiquidationDexes[weth][dai] = [sushiDex];
  }
}
