defmodule Membrane.SDK.Mixfile do
  use Mix.Project

  @version "0.1.0"
  @github_url "https://github.com/membraneframework-labs/membrane_sdk"

  def project do
    [
      app: :membrane_sdk,
      version: @version,
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),

      # hex
      description: "Package providing all plugins of the Membrane Framework",
      package: package(),

      # docs
      name: "Membrane SDK",
      source_url: @github_url,
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_env), do: ["lib"]

  defp deps do
    membrane_deps = [
      # {:membrane_http_adaptive_stream_plugin, path: "/Users/bartekch/Desktop/membrane_http_adaptive_stream_plugin"}, # after mp4_plugin update tests fail
      # {:membrane_http_adaptive_stream_plugin, "~> 0.18.3"}, # update version after new release

      # {:membrane_rtp_plugin, path: "/Users/bartekch/Desktop/membrane_rtp_plugin"}, # deps.get fail (git checkout)
      # {:membrane_rtp_plugin, "~> 0.27.2"}, # update version after new release

      # {:membrane_rtmp_plugin, path: "/Users/bartekch/Desktop/membrane_rtmp_plugin"}, # tests fail (localhost failed to connect)
      # {:membrane_rtmp_plugin, "~> 0.23.1"}, # update version after new release

      {:membrane_rtsp, path: "/Users/bartekch/Desktop/membrane_rtsp"}, # updated, release as 0.6.2
      # {:membrane_rtsp, "~> 0.6.1"}, # update version after new release

      {:membrane_matroska_plugin, path: "/Users/bartekch/Desktop/membrane_matroska_plugin"}, # updated, release as 0.5.1
      # {:membrane_matroska_plugin, "~> 0.5.0"}, # update version after new release

      {:membrane_mp4_plugin, path: "/Users/bartekch/Desktop/membrane_mp4_plugin"}, # updated, release as 0.34.1
      # {:membrane_mp4_plugin, "~> 0.34.0"}, # update version after new release

      {:membrane_raw_video_parser_plugin, path: "/Users/bartekch/Desktop/membrane_raw_video_parser_plugin"}, # updated, release as 0.12.1
      # {:membrane_raw_video_parser_plugin, "~> 0.12.0"}, # update version after new release

      {:membrane_wav_plugin, path: "/Users/bartekch/Desktop/membrane_wav_plugin"}, # updated, release as 0.10.1
      # {:membrane_wav_plugin, "~> 0.10.0"}, # update version after new release

      {:membrane_file_plugin, "~> 0.17.0"}, # done
      {:membrane_core, "~> 1.0.1"}, # done
      {:membrane_h26x_plugin, "~> 0.10.0"}, # done
      {:membrane_h264_ffmpeg_plugin, "~> 0.31.5"}, # done
      {:membrane_common_c, "~> 0.16.0"}, # done
      {:membrane_tee_plugin, "~> 0.12.0"}, # done
      {:membrane_aac_plugin, "~> 0.18.1"}, # done
      {:membrane_rtp_h264_plugin, "~> 0.19.0"}, # done
      {:membrane_rtp_opus_plugin, "~> 0.9.0"}, # done
      {:ex_sdp, "~> 0.15.0"}, # done
      {:membrane_funnel_plugin, "~> 0.9.0"}, # done
      {:membrane_rtp_vp8_plugin, "~> 0.9.0"}, # done
      {:membrane_opus_plugin, "~> 0.20.1"}, # done
      {:membrane_aac_fdk_plugin, "~> 0.18.6"}, # done
      {:membrane_realtimer_plugin, "~> 0.9.0"}, # done
      {:membrane_framerate_converter_plugin, "~> 0.8.0"}, # done
      {:membrane_generator_plugin, "~> 0.10.0"}, # done
      {:membrane_audio_mix_plugin, "~> 0.16.0"}, # done
      {:membrane_audio_filler_plugin, "~> 0.3.0"}, # done
      {:membrane_flv_plugin, "~> 0.12.0"}, # done
      {:membrane_ffmpeg_swscale_plugin, "~> 0.15.1"}, # done
      {:membrane_video_merger_plugin, "~> 0.9.0"}, # done
      {:membrane_stream_plugin, "~> 0.4.0"}, # done
      {:membrane_sdl_plugin, "~> 0.18.2"}, # done
      {:membrane_ffmpeg_swresample_plugin, "~> 0.19.2"}, # done
      {:membrane_udp_plugin, "~> 0.13.0"}, # done
      {:bunch, "~> 1.6.1"}, # done
      {:membrane_mp3_mad_plugin, "~> 0.18.2"}, # done
      {:membrane_mp3_lame_plugin, "~> 0.18.1"}, # done
      {:membrane_fake_plugin, "~> 0.11.0"}, # done
      {:membrane_hackney_plugin, "~> 0.11.0"}, # done
      {:membrane_rtp_mpegaudio_plugin, "~> 0.14.0"}, # done
      {:membrane_audiometer_plugin, "~> 0.12.0"}, # done
      {:membrane_raw_audio_format, "~> 0.12.0"}, # done
      {:membrane_ivf_plugin, "~> 0.7.0"}, # done
      {:membrane_scissors_plugin, "~> 0.8.0"}, # done
      {:membrane_flac_plugin, "~> 0.11.0"}, # done
      {:membrane_ogg_plugin, "~> 0.3.0"}, # done
      {:ex_libsrtp, "~> 0.7.2"}, # done
      {:membrane_camera_capture_plugin, "~> 0.7.2"}, # done
      {:membrane_ffmpeg_video_filter_plugin, "~> 0.13.1"}, # done
      {:membrane_portaudio_plugin, "~> 0.19.0"} # done
    ]

    membrane_deps ++
      [
        {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
        {:dialyxir, ">= 0.0.0", only: :dev, runtime: false},
        {:credo, ">= 0.0.0", only: :dev, runtime: false}
      ]
  end

  defp dialyzer() do
    opts = [
      flags: [:error_handling]
    ]

    if System.get_env("CI") == "true" do
      # Store PLTs in cacheable directory for CI
      [plt_local_path: "priv/plts", plt_core_path: "priv/plts"] ++ opts
    else
      opts
    end
  end

  defp package do
    [
      maintainers: ["Membrane Team"],
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => @github_url,
        "Membrane Framework Homepage" => "https://membraneframework.org"
      }
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md", "LICENSE"],
      formatters: ["html"],
      source_ref: "v#{@version}",
      nest_modules_by_prefix: [Membrane.SDK]
    ]
  end
end
