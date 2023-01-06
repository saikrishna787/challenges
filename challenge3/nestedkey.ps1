function Get-NestedValue {
    param(
        [Parameter(Mandatory)]
        [Object] $Object,
        [Parameter(Mandatory)]
        [String] $Key
    )

    $keys = $key -split '/'

    foreach ($k in $keys) {
        $object = $object.$k
    }
    return $object
}

$object1 = @{
    'a' = @{
        'b' = @{
            'c' = 'd'
        }
    }
}

$key1 = 'a/b/c'

$value1 = Get-NestedValue -Object $object1 -Key $key1

Write-Output $value1

$object2 = @{
    'x' = @{
        'y' = @{
            'z' = 'a'
        }
    }
}

$key2 = 'x/y/z'

$value2 = Get-NestedValue -Object $object2 -Key $key2

Write-Output $value2
