<?php

declare(strict_types=1);

namespace App\Console\Commands;

use Illuminate\Console\Command;

class Fizzbuzz extends Command
{
    /**
     * The name and signature of the console command.
     */
    protected $signature = 'app:fizzbuzz {limit : カウントアップを行う最大値（正の整数）}';

    /**
     * The console command description.
     */
    protected $description = 'FizzBuzz の結果を 1 から指定された値まで出力します';

    /**
     * Execute the console command.
     */
    public function handle(): int
    {
        $limit = $this->argument('limit');

        if (! ctype_digit((string) $limit) || (int) $limit < 1) {
            $this->error('limit は 1 以上の整数を指定してください。');

            return static::INVALID;
        }

        $max = (int) $limit;

        for ($value = 1; $value <= $max; $value++) {
            $this->line($this->convertToFizzBuzz($value));
        }

        return static::SUCCESS;
    }

    private function convertToFizzBuzz(int $value): string
    {
        $result = '';

        if ($value % 3 === 0) {
            $result .= 'Fizz';
        }

        if ($value % 5 === 0) {
            $result .= 'Buzz';
        }

        return $result !== '' ? $result : (string) $value;
    }
}
