{
  "name": "Qa AI agent",
  "nodes": [
    {
      "parameters": {
        "public": true,
        "mode": "webhook",
        "options": {}
      },
      "type": "@n8n/n8n-nodes-langchain.chatTrigger",
      "typeVersion": 1.5,
      "position": [
        0,
        0
      ],
      "id": "83348fc4-9476-48ae-92a7-bd4a18a0920a",
      "name": "When chat message received",
      "webhookId": "b6304b10-468a-41e8-86cd-69d13dbd723a"
    },
    {
      "parameters": {
        "options": {
          "systemMessage": "You are a helpful Q&A assistant that answers questions based on feedback data. Use Use tools to search for relevant information by querying the 'question' and 'tags' columns. When a user asks a question, search the QA database to find matching questions or relevant tags, then provide the corresponding answer. If you find multiple relevant entries, synthesize the information. If no relevant information is found, politely inform the user that you don't have that information in the QA database."
        }
      },
      "type": "@n8n/n8n-nodes-langchain.agent",
      "typeVersion": 3.1,
      "position": [
        224,
        0
      ],
      "id": "198f3ae3-e034-4904-a07a-780cc0e22bf6",
      "name": "AI Agent"
    },
    {
      "parameters": {
        "model": {
          "__rl": true,
          "mode": "list",
          "value": "gpt-5-mini"
        },
        "builtInTools": {},
        "options": {}
      },
      "type": "@n8n/n8n-nodes-langchain.lmChatOpenAi",
      "typeVersion": 1.3,
      "position": [
        128,
        208
      ],
      "id": "9e284bb1-7715-431c-99ad-f8980651227f",
      "name": "OpenAI Chat Model",
      "credentials": {
        "openAiApi": {
          "id": null,
          "name": "",
          "__aiGatewayManaged": true
        }
      }
    },
    {
      "parameters": {},
      "type": "@n8n/n8n-nodes-langchain.memoryBufferWindow",
      "typeVersion": 1.4,
      "position": [
        240,
        208
      ],
      "id": "74267801-84c6-4168-b145-a891cc4fe8fe",
      "name": "Simple Memory"
    },
    {
      "parameters": {
        "descriptionType": "manual",
        "toolDescription": "Use this tool to search the Feedback data table for relevant entries. Provide a search query that will be matched against the \"question' column to find relevant feedback. The tool returns matching entries with their answers. Always provide a specific search term based on what the user is asking about.",
        "operation": "get",
        "dataTableId": {
          "__rl": true,
          "value": "8nrXKkmSUHZaH54B",
          "mode": "list",
          "cachedResultName": "qna",
          "cachedResultUrl": "/projects/COnzH3olCXcdfnqy/datatables/8nrXKkmSUHZaH54B"
        },
        "filters": {
          "conditions": [
            {
              "keyName": "Question",
              "condition": "like",
              "keyValue": "={{ /*n8n-auto-generated-fromAI-override*/ $fromAI('conditions0_Value', `The search term or question to look for in the feedback database.Filters by questions containing your search term so use single words or short fragments`, 'string') }}"
            },
            {
              "keyName": "tags",
              "condition": "ilike",
              "keyValue": "={{ /*n8n-auto-generated-fromAI-override*/ $fromAI('conditions1_Value', `Key terms for this question answer pair that was classified by AI.Use one search term per tool invocation.`, 'string') }}"
            }
          ]
        },
        "returnAll": true
      },
      "type": "n8n-nodes-base.dataTableTool",
      "typeVersion": 1.1,
      "position": [
        384,
        208
      ],
      "id": "1d0cb437-9178-4bc1-88e0-91cad40396a8",
      "name": "Fetch-qa-db"
    }
  ],
  "pinData": {
    "When chat message received": [
      {
        "json": {
          "action": "sendMessage",
          "sessionId": "05cce854b98343eabf3f423cdc670f5d",
          "chatInput": "how to be an ambassodor "
        },
        "pairedItem": {
          "item": 0
        }
      }
    ]
  },
  "connections": {
    "When chat message received": {
      "main": [
        [
          {
            "node": "AI Agent",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "OpenAI Chat Model": {
      "ai_languageModel": [
        [
          {
            "node": "AI Agent",
            "type": "ai_languageModel",
            "index": 0
          }
        ]
      ]
    },
    "Simple Memory": {
      "ai_memory": [
        [
          {
            "node": "AI Agent",
            "type": "ai_memory",
            "index": 0
          }
        ]
      ]
    },
    "Fetch-qa-db": {
      "ai_tool": [
        [
          {
            "node": "AI Agent",
            "type": "ai_tool",
            "index": 0
          }
        ]
      ]
    }
  },
  "active": true,
  "settings": {
    "executionOrder": "v1",
    "binaryMode": "separate"
  },
  "versionId": "5afac33b-6f74-428a-a652-597011f62105",
  "meta": {
    "templateCredsSetupCompleted": true,
    "instanceId": "9e4691aa135a984f944c3054269c7784685e3b511db42921200cd9fa2260a0e3"
  },
  "nodeGroups": [],
  "id": "uhqM9pgQhP1md5uR",
  "tags": []
}
