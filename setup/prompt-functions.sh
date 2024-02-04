

: '
    Function: prompt_yes_no

    Description:
    Prompts for a case insensitive y/n response up to 3 times using a provided prompt string and calling a provided callback on a successful (y) response.

    Parameters:
    - $1: The prompt to ask - should include the ?, but does not need (y/n)
    - $2: The callback function to run upon affirmative (y) response

    Example:
    ```bash
    prompt_yes_no "Do you want to do this thing?" callback_function
    ```
'
function prompt_yes_no {
    local attempts=0

    local prompt="$1"
    local callback="$2"


    # Check if a callback function provided is indeed a function.
    if [[ "$(type -t "$callback")" != "function" ]]; then
        echo "😭 Invalid callback function provided for prompt '${prompt}'. Exiting."
        exit 1
    fi

    while [ "$attempts" -lt 3 ]; do
        # Prompt the user with a yes/no question
        read -p "${prompt} (y/n): " answer

        # Check the user's response
        if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
            # Invoke the provided function
            "$callback"
            break  # Exit the loop if a valid response is provided
        elif [[ "$answer" == "n" || "$answer" == "N" ]]; then
            break  # Exit the loop if a valid response is provided
        else
            echo "🤷 Invalid choice. Please enter 'y' or 'n'."
            ((attempts++))
        fi
    done

    if [[ "$attempts" -eq 3 ]]; then
        echo "🙅 Reached maximum attempts. Skipping."
    fi
}



: '
    Function: prompt_yes_no_both

    Description:
    Prompts for a case insensitive y/n response up to 3 times using a provided prompt string and calling a provided callback on either response.

    Parameters:
    - $1: The prompt to ask - should include the ?, but does not need (y/n)
    - $2: The callback function to run upon successful (y) response

    Example:
    ```bash
    prompt_yes_no_both "Do you want to do this thing?" affirmative_function negative_function
    ```
'
function prompt_yes_no_both {
    local attempts=0

    local prompt="$1"
    local callback_affirmative="$2"
    local callback_negative="$3"


    # Check if a callback function provided is indeed a function.
    if [[ "$(type -t "$callback_affirmative")" != "function" ||  "$(type -t "$callback_negative")" != "function" ]]; then
        echo "😭 Invalid callback function(s) provided for prompt '${prompt}'. Exiting."
        exit 1
    fi

    while [ "$attempts" -lt 3 ]; do
        # Prompt the user with a yes/no question
        read -p "${prompt} (y/n): " answer

        # Check the user's response
        if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
            # Invoke the provided function
            "$callback_affirmative"
            break  # Exit the loop if a valid response is provided
        elif [[ "$answer" == "n" || "$answer" == "N" ]]; then
            # Invoke the provided function
            "$callback_negative"
            break  # Exit the loop if a valid response is provided
        else
            echo "🤷 Invalid choice. Please enter 'y' or 'n'."
            ((attempts++))
        fi
    done

    if [[ "$attempts" -eq 3 ]]; then
        echo "🙅 Reached maximum attempts, assuming 'n' response."
        # Invoke the provided function
        "$callback_negative"
    fi
}
