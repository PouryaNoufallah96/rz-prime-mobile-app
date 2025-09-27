import 'dart:convert';

import 'package:gainx/core/env.dart';
import 'package:web3dart/web3dart.dart';

class AppContractAbi {
  static DeployedContract get appContract {
    final contract = DeployedContract(
      ContractAbi.fromJson(jsonEncode(_appAbi), Env.appContractName),
      EthereumAddress.fromHex(Env.appContractAddress),
    );

    return contract;
  }

  static ContractFunction get executeOrderFunction {
    return appContract.function('executeOrder');
  }

  static DeployedContract get erc20Contract {
    final contract = DeployedContract(
      ContractAbi.fromJson(jsonEncode(_erc20Abi), Env.erc20Name),
      EthereumAddress.fromHex(Env.erc20Address),
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
        {'internalType': 'address', 'name': '_usdToken', 'type': 'address'}
      ],
      'stateMutability': 'nonpayable',
      'type': 'constructor'
    },
    {'inputs': [], 'name': 'ECDSAInvalidSignature', 'type': 'error'},
    {
      'inputs': [
        {'internalType': 'uint256', 'name': 'length', 'type': 'uint256'}
      ],
      'name': 'ECDSAInvalidSignatureLength',
      'type': 'error'
    },
    {
      'inputs': [
        {'internalType': 'bytes32', 'name': 's', 'type': 'bytes32'}
      ],
      'name': 'ECDSAInvalidSignatureS',
      'type': 'error'
    },
    {'inputs': [], 'name': 'EnforcedPause', 'type': 'error'},
    {'inputs': [], 'name': 'ExpectedPause', 'type': 'error'},
    {'inputs': [], 'name': 'InvalidShortString', 'type': 'error'},
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
      'inputs': [
        {'internalType': 'address', 'name': 'token', 'type': 'address'}
      ],
      'name': 'SafeERC20FailedOperation',
      'type': 'error'
    },
    {
      'inputs': [
        {'internalType': 'string', 'name': 'str', 'type': 'string'}
      ],
      'name': 'StringTooLong',
      'type': 'error'
    },
    {
      'anonymous': false,
      'inputs': [],
      'name': 'EIP712DomainChanged',
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
        }
      ],
      'name': 'OrderDropped',
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
        }
      ],
      'name': 'OrderExpired',
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
      'anonymous': false,
      'inputs': [
        {
          'indexed': false,
          'internalType': 'address',
          'name': 'account',
          'type': 'address'
        }
      ],
      'name': 'Paused',
      'type': 'event'
    },
    {
      'anonymous': false,
      'inputs': [
        {
          'indexed': false,
          'internalType': 'address',
          'name': 'account',
          'type': 'address'
        }
      ],
      'name': 'Unpaused',
      'type': 'event'
    },
    {
      'inputs': [],
      'name': 'DROP_ORDER_TYPEHASH',
      'outputs': [
        {'internalType': 'bytes32', 'name': '', 'type': 'bytes32'}
      ],
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address[]', 'name': 'users', 'type': 'address[]'},
        {'internalType': 'string[]', 'name': 'orderIds', 'type': 'string[]'},
        {'internalType': 'bytes[]', 'name': 'signatures', 'type': 'bytes[]'}
      ],
      'name': 'batchDropOrderBySig',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address[]', 'name': 'users', 'type': 'address[]'},
        {'internalType': 'string[]', 'name': 'orderIds', 'type': 'string[]'}
      ],
      'name': 'batchExpireOrder',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [
        {'internalType': 'address', 'name': 'user', 'type': 'address'},
        {'internalType': 'string', 'name': 'orderId', 'type': 'string'},
        {'internalType': 'bytes', 'name': 'signature', 'type': 'bytes'}
      ],
      'name': 'dropOrderBySig',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'eip712Domain',
      'outputs': [
        {'internalType': 'bytes1', 'name': 'fields', 'type': 'bytes1'},
        {'internalType': 'string', 'name': 'name', 'type': 'string'},
        {'internalType': 'string', 'name': 'version', 'type': 'string'},
        {'internalType': 'uint256', 'name': 'chainId', 'type': 'uint256'},
        {
          'internalType': 'address',
          'name': 'verifyingContract',
          'type': 'address'
        },
        {'internalType': 'bytes32', 'name': 'salt', 'type': 'bytes32'},
        {'internalType': 'uint256[]', 'name': 'extensions', 'type': 'uint256[]'}
      ],
      'stateMutability': 'view',
      'type': 'function'
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
      'name': 'expireOrder',
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
              'internalType': 'enum RZPrimeSale.OrderStatus',
              'name': 'status',
              'type': 'uint8'
            }
          ],
          'internalType': 'struct RZPrimeSale.Order',
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
          'internalType': 'enum RZPrimeSale.OrderStatus',
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
      'inputs': [],
      'name': 'pause',
      'outputs': [],
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'inputs': [],
      'name': 'paused',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
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
        {'internalType': 'address', 'name': 'token', 'type': 'address'}
      ],
      'name': 'reservedTokenAmounts',
      'outputs': [
        {'internalType': 'uint256', 'name': 'amounts', 'type': 'uint256'}
      ],
      'stateMutability': 'view',
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
      'name': 'unpause',
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
      'inputs': [],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'constructor'
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
      'constant': true,
      'inputs': [
        {'internalType': 'address', 'name': 'owner', 'type': 'address'},
        {'internalType': 'address', 'name': 'spender', 'type': 'address'}
      ],
      'name': 'allowance',
      'outputs': [
        {'internalType': 'uint256', 'name': '', 'type': 'uint256'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [
        {'internalType': 'address', 'name': 'spender', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'amount', 'type': 'uint256'}
      ],
      'name': 'approve',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [
        {'internalType': 'address', 'name': 'account', 'type': 'address'}
      ],
      'name': 'balanceOf',
      'outputs': [
        {'internalType': 'uint256', 'name': '', 'type': 'uint256'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [],
      'name': 'decimals',
      'outputs': [
        {'internalType': 'uint8', 'name': '', 'type': 'uint8'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [
        {'internalType': 'address', 'name': 'spender', 'type': 'address'},
        {
          'internalType': 'uint256',
          'name': 'subtractedValue',
          'type': 'uint256'
        }
      ],
      'name': 'decreaseAllowance',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [],
      'name': 'getOwner',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [
        {'internalType': 'address', 'name': 'spender', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'addedValue', 'type': 'uint256'}
      ],
      'name': 'increaseAllowance',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [],
      'name': 'name',
      'outputs': [
        {'internalType': 'string', 'name': '', 'type': 'string'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [],
      'name': 'owner',
      'outputs': [
        {'internalType': 'address', 'name': '', 'type': 'address'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [],
      'name': 'renounceOwnership',
      'outputs': [],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [],
      'name': 'symbol',
      'outputs': [
        {'internalType': 'string', 'name': '', 'type': 'string'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': true,
      'inputs': [],
      'name': 'totalSupply',
      'outputs': [
        {'internalType': 'uint256', 'name': '', 'type': 'uint256'}
      ],
      'payable': false,
      'stateMutability': 'view',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [
        {'internalType': 'address', 'name': 'recipient', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'amount', 'type': 'uint256'}
      ],
      'name': 'transfer',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [
        {'internalType': 'address', 'name': 'sender', 'type': 'address'},
        {'internalType': 'address', 'name': 'recipient', 'type': 'address'},
        {'internalType': 'uint256', 'name': 'amount', 'type': 'uint256'}
      ],
      'name': 'transferFrom',
      'outputs': [
        {'internalType': 'bool', 'name': '', 'type': 'bool'}
      ],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    },
    {
      'constant': false,
      'inputs': [
        {'internalType': 'address', 'name': 'newOwner', 'type': 'address'}
      ],
      'name': 'transferOwnership',
      'outputs': [],
      'payable': false,
      'stateMutability': 'nonpayable',
      'type': 'function'
    }
  ];
}
