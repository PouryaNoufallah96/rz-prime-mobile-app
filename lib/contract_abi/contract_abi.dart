import 'dart:convert';

import 'package:gainx/core/env.dart';
import 'package:reown_walletkit/reown_walletkit.dart';

class AppContractAbi {
  static DeployedContract get appContract {
    final contract = DeployedContract(
      ContractAbi.fromJson(_appAbiJson, Env.appContractName),
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

  // RZPrime contract ABI.
  static const String _appAbiJson = '''
[
    {
        "type": "function",
        "name": "ORACLE",
        "inputs": [],
        "outputs": [
            {
                "name": "",
                "type": "address",
                "internalType": "contract IRZUSDTwapOracle"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "batchDropOrderBySig",
        "inputs": [
            {
                "name": "users",
                "type": "address[]",
                "internalType": "address[]"
            },
            {
                "name": "orderIds",
                "type": "string[]",
                "internalType": "string[]"
            },
            {
                "name": "signatures",
                "type": "bytes[]",
                "internalType": "bytes[]"
            }
        ],
        "outputs": [],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "batchExpireOrder",
        "inputs": [
            {
                "name": "users",
                "type": "address[]",
                "internalType": "address[]"
            },
            {
                "name": "orderIds",
                "type": "string[]",
                "internalType": "string[]"
            }
        ],
        "outputs": [],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "dropOrderBySig",
        "inputs": [
            {
                "name": "user",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "orderId",
                "type": "string",
                "internalType": "string"
            },
            {
                "name": "signature",
                "type": "bytes",
                "internalType": "bytes"
            }
        ],
        "outputs": [],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "executeOrder",
        "inputs": [
            {
                "name": "orderId",
                "type": "string",
                "internalType": "string"
            }
        ],
        "outputs": [],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "expireOrder",
        "inputs": [
            {
                "name": "user",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "orderId",
                "type": "string",
                "internalType": "string"
            }
        ],
        "outputs": [],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "getOrder",
        "inputs": [
            {
                "name": "user",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "orderId",
                "type": "string",
                "internalType": "string"
            }
        ],
        "outputs": [
            {
                "name": "",
                "type": "tuple",
                "internalType": "struct RZPrime.Order",
                "components": [
                    {
                        "name": "buyToken",
                        "type": "address",
                        "internalType": "address"
                    },
                    {
                        "name": "tokenAmount",
                        "type": "uint256",
                        "internalType": "uint256"
                    },
                    {
                        "name": "payUsdValue",
                        "type": "uint256",
                        "internalType": "uint256"
                    },
                    {
                        "name": "endAt",
                        "type": "uint256",
                        "internalType": "uint256"
                    },
                    {
                        "name": "status",
                        "type": "uint8",
                        "internalType": "enum RZPrime.OrderStatus"
                    }
                ]
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "operator",
        "inputs": [],
        "outputs": [
            {
                "name": "",
                "type": "address",
                "internalType": "address"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "orders",
        "inputs": [
            {
                "name": "",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "",
                "type": "bytes32",
                "internalType": "bytes32"
            }
        ],
        "outputs": [
            {
                "name": "buyToken",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "tokenAmount",
                "type": "uint256",
                "internalType": "uint256"
            },
            {
                "name": "payUsdValue",
                "type": "uint256",
                "internalType": "uint256"
            },
            {
                "name": "endAt",
                "type": "uint256",
                "internalType": "uint256"
            },
            {
                "name": "status",
                "type": "uint8",
                "internalType": "enum RZPrime.OrderStatus"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "paused",
        "inputs": [],
        "outputs": [
            {
                "name": "",
                "type": "bool",
                "internalType": "bool"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "previewPaymentAmount",
        "inputs": [
            {
                "name": "user",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "orderId",
                "type": "string",
                "internalType": "string"
            }
        ],
        "outputs": [
            {
                "name": "rzusdAmount",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "registerUserOrder",
        "inputs": [
            {
                "name": "user",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "orderId",
                "type": "string",
                "internalType": "string"
            },
            {
                "name": "buyToken",
                "type": "address",
                "internalType": "address"
            },
            {
                "name": "tokenAmount",
                "type": "uint256",
                "internalType": "uint256"
            },
            {
                "name": "payUsdValue",
                "type": "uint256",
                "internalType": "uint256"
            },
            {
                "name": "endAt",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "outputs": [],
        "stateMutability": "nonpayable"
    },
    {
        "type": "function",
        "name": "reservedTokenAmounts",
        "inputs": [
            {
                "name": "token",
                "type": "address",
                "internalType": "address"
            }
        ],
        "outputs": [
            {
                "name": "amounts",
                "type": "uint256",
                "internalType": "uint256"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "function",
        "name": "vault",
        "inputs": [],
        "outputs": [
            {
                "name": "",
                "type": "address",
                "internalType": "address"
            }
        ],
        "stateMutability": "view"
    },
    {
        "type": "event",
        "name": "OrderDropped",
        "inputs": [
            {
                "name": "user",
                "type": "address",
                "indexed": false,
                "internalType": "address"
            },
            {
                "name": "orderId",
                "type": "string",
                "indexed": false,
                "internalType": "string"
            }
        ],
        "anonymous": false
    },
    {
        "type": "event",
        "name": "OrderExecuted",
        "inputs": [
            {
                "name": "user",
                "type": "address",
                "indexed": false,
                "internalType": "address"
            },
            {
                "name": "orderId",
                "type": "string",
                "indexed": false,
                "internalType": "string"
            },
            {
                "name": "rzusdPaid",
                "type": "uint256",
                "indexed": false,
                "internalType": "uint256"
            },
            {
                "name": "usdValue",
                "type": "uint256",
                "indexed": false,
                "internalType": "uint256"
            }
        ],
        "anonymous": false
    },
    {
        "type": "event",
        "name": "OrderExpired",
        "inputs": [
            {
                "name": "user",
                "type": "address",
                "indexed": false,
                "internalType": "address"
            },
            {
                "name": "orderId",
                "type": "string",
                "indexed": false,
                "internalType": "string"
            }
        ],
        "anonymous": false
    },
    {
        "type": "event",
        "name": "OrderRegistered",
        "inputs": [
            {
                "name": "user",
                "type": "address",
                "indexed": false,
                "internalType": "address"
            },
            {
                "name": "orderId",
                "type": "string",
                "indexed": false,
                "internalType": "string"
            },
            {
                "name": "tokenAmount",
                "type": "uint256",
                "indexed": false,
                "internalType": "uint256"
            }
        ],
        "anonymous": false
    },
    {
        "type": "event",
        "name": "Paused",
        "inputs": [
            {
                "name": "account",
                "type": "address",
                "indexed": false,
                "internalType": "address"
            }
        ],
        "anonymous": false
    },
    {
        "type": "event",
        "name": "Unpaused",
        "inputs": [
            {
                "name": "account",
                "type": "address",
                "indexed": false,
                "internalType": "address"
            }
        ],
        "anonymous": false
    },
    {
        "type": "error",
        "name": "ECDSAInvalidSignature",
        "inputs": []
    },
    {
        "type": "error",
        "name": "ECDSAInvalidSignatureLength",
        "inputs": [
            {
                "name": "length",
                "type": "uint256",
                "internalType": "uint256"
            }
        ]
    },
    {
        "type": "error",
        "name": "ECDSAInvalidSignatureS",
        "inputs": [
            {
                "name": "s",
                "type": "bytes32",
                "internalType": "bytes32"
            }
        ]
    },
    {
        "type": "error",
        "name": "EnforcedPause",
        "inputs": []
    },
    {
        "type": "error",
        "name": "ExpectedPause",
        "inputs": []
    },
    {
        "type": "error",
        "name": "InvalidShortString",
        "inputs": []
    },
    {
        "type": "error",
        "name": "OwnableInvalidOwner",
        "inputs": [
            {
                "name": "owner",
                "type": "address",
                "internalType": "address"
            }
        ]
    },
    {
        "type": "error",
        "name": "OwnableUnauthorizedAccount",
        "inputs": [
            {
                "name": "account",
                "type": "address",
                "internalType": "address"
            }
        ]
    },
    {
        "type": "error",
        "name": "ReentrancyGuardReentrantCall",
        "inputs": []
    },
    {
        "type": "error",
        "name": "SafeERC20FailedOperation",
        "inputs": [
            {
                "name": "token",
                "type": "address",
                "internalType": "address"
            }
        ]
    },
    {
        "type": "error",
        "name": "StringTooLong",
        "inputs": [
            {
                "name": "str",
                "type": "string",
                "internalType": "string"
            }
        ]
    }
]''';

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
