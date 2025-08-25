import 'dart:convert';

import 'package:web3dart/web3dart.dart';

class AppContractAbi {
  static DeployedContract get appContract {
    final contract = DeployedContract(
      ContractAbi.fromJson(jsonEncode(_appAbi), 'TokenForwardSale'),
      EthereumAddress.fromHex(
        '0xB0D6B2805C09A37c762c3599fA932DC5Dc0D65c3',
      ),
    );

    return contract;
  }

  static ContractFunction get executeOrderFunction {
    return appContract.function('executeOrder');
  }

  static DeployedContract get erc20Contract {
    final contract = DeployedContract(
      ContractAbi.fromJson(jsonEncode(_erc20Abi), 'MockERC20'),
      EthereumAddress.fromHex(
        '0xbeeAF6AEa7D96015b27a3D5a11eB47D0cF330E16',
      ),
    );

    return contract;
  }

  static ContractFunction get approveFunction {
    return erc20Contract.function('approve');
  }

  static final List<Map<String, Object>> _appAbi = [
    {
      'inputs': [
        {'internalType': 'address', 'name': '_operator', 'type': 'address'},
        {'internalType': 'address', 'name': '_owner', 'type': 'address'},
        {'internalType': 'address', 'name': '_vault', 'type': 'address'},
        {'internalType': 'address', 'name': '_usdt', 'type': 'address'}
      ],
      'stateMutability': 'nonpayable',
      'type': 'constructor'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'owner', 'type': 'address'}
      ],
      'name': 'OwnableInvalidOwner',
      'type': 'error'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'account', 'type': 'address'}
      ],
      'name': 'OwnableUnauthorizedAccount',
      'type': 'error'
    },
    {'inputs': [], 'name': 'ReentrancyGuardReentrantCall', 'type': 'error'},
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': false,
          'internalType': 'address',
          'name': 'user',
          'type': 'address'
        },
        {
          'indexed': false,
          'internalType': 'string',
          'name': 'orderId',
          'type': 'string'
        },
        {
          'indexed': false,
          'internalType': 'uint256',
          'name': 'payAmount',
          'type': 'uint256'
        }
      ],
      'name': 'OrderExecuted',
      'type': 'event'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': false,
          'internalType': 'address',
          'name': 'user',
          'type': 'address'
        },
        {
          'indexed': false,
          'internalType': 'string',
          'name': 'orderId',
          'type': 'string'
        },
        {
          'indexed': false,
          'internalType': 'uint256',
          'name': 'tokenAmount',
          'type': 'uint256'
        }
      ],
      'name': 'OrderRegistered',
      'type': 'event'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'previousOwner',
          'type': 'address'
        },
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'newOwner',
          'type': 'address'
        }
      ],
      'name': 'OwnershipTransferred',
      'type': 'event'
    },
    {
      'inputs': [
        {'internalType': 'string', 'name': 'orderId', 'type': 'string'}
      ],
      'name': 'executeOrder',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'user', 'type': 'address'},
        {'internalType': 'string', 'name': 'orderId', 'type': 'string'}
      ],
      'name': 'getOrder',
      'outputs': [
        {
          'components': [
            {'internalType': 'address', 'name': 'buyToken', 'type': 'address'},
            {
              'internalType': 'uint256',
              'name': 'tokenAmount',
              'type': 'uint256'
            },
            {'internalType': 'uint256', 'name': 'payAmount', 'type': 'uint256'},
            {'internalType': 'uint256', 'name': 'endAt', 'type': 'uint256'},
            {
              'internalType': 'enum TokenForwardSale.OrderStatus',
              'name': 'status',
              'type': 'uint8'
            }
          ],
          'internalType': 'struct TokenForwardSale.Order',
          'name': '',
          'type': 'tuple'
        }
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'operator',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'},
        {'internalType': 'bytes32', 'name': '', 'type': 'bytes32'}
      ],
      'name': 'orders',
      'outputs': [
        {'internalType': 'address', 'name': 'buyToken', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'tokenAmount', 'type': 'uint256'},
        {'internalType': 'uint256', 'name': 'payAmount', 'type': 'uint256'},
        {'internalType': 'uint256', 'name': 'endAt', 'type': 'uint256'},
        {
          'internalType': 'enum TokenForwardSale.OrderStatus',
          'name': 'status',
          'type': 'uint8'
        }
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'owner',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'user', 'type': 'address'},
        {'internalType': 'string', 'name': 'orderId', 'type': 'string'},
        {'internalType': 'address', 'name': 'buyToken', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'tokenAmount', 'type': 'uint256'},
        {'internalType': 'uint256', 'name': 'payAmount', 'type': 'uint256'},
        {'internalType': 'uint256', 'name': 'endAt', 'type': 'uint256'}
      ],
      'name': 'registerUserOrder',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'renounceOwnership',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': '_operator', 'type': 'address'}
      ],
      'name': 'setOperator',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': '_vault', 'type': 'address'}
      ],
      'name': 'setVault',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'newOwner', 'type': 'address'}
      ],
      'name': 'transferOwnership',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'vault',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'token', 'type': 'address'},
        {'internalType': 'address', 'name': 'to', 'type': 'address'}
      ],
      'name': 'withdrawTokens',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    }
  ];

  static final List<Map<String, Object>> _erc20Abi = [
    {
      'inputs': [
        {'internalType': 'string', 'name': 'name', 'type': 'string'},
        {'internalType': 'string', 'name': 'symbol', 'type': 'string'},
        {'internalType': 'uint8', 'name': 'decimals_', 'type': 'uint8'}
      ],
      'stateMutability': 'nonpayable',
      'type': 'constructor'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'spender', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'allowance', 'type': 'uint256'},
        {'internalType': 'uint256', 'name': 'needed', 'type': 'uint256'}
      ],
      'name': 'ERC20InsufficientAllowance',
      'type': 'error'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'sender', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'balance', 'type': 'uint256'},
        {'internalType': 'uint256', 'name': 'needed', 'type': 'uint256'}
      ],
      'name': 'ERC20InsufficientBalance',
      'type': 'error'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'approver', 'type': 'address'}
      ],
      'name': 'ERC20InvalidApprover',
      'type': 'error'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'receiver', 'type': 'address'}
      ],
      'name': 'ERC20InvalidReceiver',
      'type': 'error'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'sender', 'type': 'address'}
      ],
      'name': 'ERC20InvalidSender',
      'type': 'error'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'spender', 'type': 'address'}
      ],
      'name': 'ERC20InvalidSpender',
      'type': 'error'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'owner',
          'type': 'address'
        },
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'spender',
          'type': 'address'
        },
        {
          'indexed': false,
          'internalType': 'uint256',
          'name': 'value',
          'type': 'uint256'
        }
      ],
      'name': 'Approval',
      'type': 'event'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'from',
          'type': 'address'
        },
        {
          'indexed': true,
          'internalType': 'address',
          'name': 'to',
          'type': 'address'
        },
        {
          'indexed': false,
          'internalType': 'uint256',
          'name': 'value',
          'type': 'uint256'
        }
      ],
      'name': 'Transfer',
      'type': 'event'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'owner', 'type': 'address'},
        {'internalType': 'address', 'name': 'spender', 'type': 'address'}
      ],
      'name': 'allowance',
      'outputs': [
        {'internalType': 'uint256', 'name': '', 'type': 'uint256'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'spender', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'value', 'type': 'uint256'}
      ],
      'name': 'approve',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'account', 'type': 'address'}
      ],
      'name': 'balanceOf',
      'outputs': [
        {'internalType': 'uint256', 'name': '', 'type': 'uint256'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'decimals',
      'outputs': [
        {'internalType': 'uint8', 'name': '', 'type': 'uint8'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'to', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'amount', 'type': 'uint256'}
      ],
      'name': 'mint',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'name',
      'outputs': [
        {'internalType': 'string', 'name': '', 'type': 'string'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'symbol',
      'outputs': [
        {'internalType': 'string', 'name': '', 'type': 'string'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'totalSupply',
      'outputs': [
        {'internalType': 'uint256', 'name': '', 'type': 'uint256'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'to', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'value', 'type': 'uint256'}
      ],
      'name': 'transfer',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'from', 'type': 'address'},
        {'internalType': 'address', 'name': 'to', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'value', 'type': 'uint256'}
      ],
      'name': 'transferFrom',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'stateMutability': 'nonpayable',
      'type': 'function'
    }
  ];
}
